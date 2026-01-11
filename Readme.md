# Log Archive CLI Tool

A lightweight, secure command-line tool for archiving system logs with timestamps.  
Designed for Unix-based systems and DevOps workflows, with both **local** and **Docker** usage in mind.
More about this project roadmap can be found here: [Roadmap.sh Project Page](https://roadmap.sh/projects/log-archive-tool)

---

## ✨ Features

- Archive logs from any directory
- Timestamped `.tar.gz` archives
- Centralized archive storage
- Simple CLI interface
- Cron-friendly
- Docker-ready (small, optimized image)
- Explicit, documented security decisions

---

## 📦 Project Structure

```

log-archive-cli/
├── log-archive      # Main CLI script
├── install.sh       # Local installation script
├── Dockerfile       # Optimized Docker image
├── .dockerignore
├── .gitignore
└── README.md

````

---

## 🚀 Local Installation

Clone the repository:

```bash
git clone https://github.com/hackhawk-arch/log-archive-cli.git
cd log-archive-cli
````

Run the installer:

```bash
chmod +x install.sh
./install.sh
```

This installs the command to:

```
/usr/local/bin/log-archive
```

---

## ▶️ Local Usage

```bash
log-archive /var/log
```

Some system logs require elevated privileges:

```bash
sudo log-archive /var/log
```

---

## 📁 Archive Output

Archives are stored in:

```
~/log-archives/
```

Each archive is named using the format:

```
logs-YYYY-MM-DD_HH-MM-SS.tar.gz
```

A log of archive operations is written to:

```
~/log-archives/archive.log
```

---

## 🐳 Docker Usage (Recommended)

### Build the image

```bash
docker build -t log-archive .
```

### Run the container

```bash
docker run --rm \
  -v /var/log:/logs:ro \
  -v $HOME/log-archives:/root/log-archives \
  log-archive /logs
```

### Notes

* Host logs are mounted **read-only**
* Archives are written to the host
* Container exits immediately after completion

---

## 🔐 Security Notes (Docker)

This container runs as **root by design**.

The tool performs system maintenance tasks that require read access to host log files
(e.g. `/var/log`). The container is:

* Short-lived (one-shot execution)
* Not network-exposed
* Not listening on any ports
* Processing trusted local input only
* Mounting host logs as **read-only**

This design aligns with the **principle of least privilege** for administrative
maintenance tools, where elevated access is required only for the duration of execution.

---

## 🛠 Requirements

### Local

* Bash or POSIX shell
* `tar`
* Unix-based OS

### Docker

* Docker Engine (recommended approach)

---

## ⏱️ Scheduling with Cron (Optional)

To archive logs daily at midnight:

```bash
crontab -e
```

Add:

```bash
0 0 * * * /usr/local/bin/log-archive /var/log
```

---

## 🧠 Design Philosophy

* Simple over clever
* Explicit over implicit
* Short-lived containers over long-running services
* Documented security trade-offs
* Minimal dependencies and small image size

---

## 🔜 Future Improvements

Planned enhancements include:

* `--dry-run` and `--verbose` flags
* Archive retention / cleanup policies
* Docker Hub publishing
* GitHub Actions CI (shellcheck + docker build)
* Optional compression level tuning

---
