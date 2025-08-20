# Bash Shell Scripting - Complete Guide

Welcome! এই গাইডে আমরা Beginner থেকে Intermediate পর্যন্ত Bash shell scripting শিখবো—step-by-step, lots of examples, এবং practical tips সহ। 💪🐚

---

## 📖 Introduction

- What is Bash?
  - Bash (Bourne Again SHell) হলো একটি command-line shell এবং scripting language, যা Linux/Unix systems-এ ডিফল্ট হিসেবে বেশি ব্যবহার হয়।
- Why learn Shell scripting?
  - Repetitive কাজ automate করা, system admin tasks, DevOps pipelines, quick data processing, server maintenance—সবকিছুতে Bash super helpful.
- Common uses in Linux/Unix systems
  - File/Process management, backups, log analysis, monitoring, deployment, cron jobs, installer scripts, text processing (grep/sed/awk).

---

## ⚙️ Basics of Shell

- What is a shell?
  - Shell হলো একটি program যেটা আপনার commands interpret করে OS-কে instruct করে।
- Types of shells
  - sh, bash, zsh, ksh, fish ইত্যাদি। Most popular: bash & zsh.
- How to check default shell

```bash
echo $SHELL
# Output example: /bin/bash or /bin/zsh
```

Tip: Windows এ WSL/WSL2 বা Git Bash ব্যবহার করলে Bash scripts রান করা সহজ হয়।

---

## 📝 Writing First Script

- Steps to create a `.sh` file
  1. Create file: `touch hello.sh`
  2. Add shebang (interpreter): `#!/usr/bin/env bash`
  3. Write your code and save.
- How to run a script

```bash
bash hello.sh           # Directly with bash
./hello.sh              # Run as executable (needs +x)
```

- Adding executable permission

```bash
chmod +x hello.sh
```

- Example: "Hello World" script

```bash
#!/usr/bin/env bash
# Simple Hello World (বাংলা + English)
echo "Hello, Bash! স্বাগতম Bash scripting এ!"
```

---

## 🔹 Variables

- Creating variables

```bash
name="Rafi"
age=25
```

- Accessing variables with `$`

```bash
echo "Name: $name, Age: $age"
```

- Environment variables

```bash
echo $PATH
echo $HOME
echo $USER
```

- Read-only variables

```bash
readonly APP_ENV="prod"
# APP_ENV="dev"  # ❌ Error: readonly variable
```

- Unsetting variables

```bash
unset name
```

Note: Variables-এর মধ্যে space দেবেন না: `x = 1` ❌, `x=1` ✅

---

## 🔹 User Input

- `read` command for input

```bash
read -p "Enter your name: " user_name
echo "Hi $user_name! কেমন আছেন?"
```

- With silent input (e.g., passwords)

```bash
read -s -p "Enter password: " pwd
echo
echo "Password length: ${#pwd}"
```

---

## 🔹 Operators

- Arithmetic operators: `+ - * / %` (use `$(( ))`)

```bash
a=7; b=3
sum=$((a + b))
mod=$((a % b))
```

- Relational (integers, test with `[ ]`)
  - `-eq, -ne, -lt, -gt, -le, -ge`

```bash
if [ "$a" -gt "$b" ]; then echo "a>b"; fi
```

- Logical operators: `&&, ||, !`

```bash
[ -f file.txt ] && echo "Exists" || echo "Not found"
```

- String operators: `=, !=, -z, -n`

```bash
s="hi"
[ -n "$s" ] && echo "not empty"
[ -z "$s2" ] && echo "empty"
```

### Handy test operators (files)

| Test    | Meaning (English + Bangla)       |
| ------- | -------------------------------- |
| -e file | File exists (ফাইল আছে)           |
| -f file | Regular file (সাধারণ ফাইল)       |
| -d dir  | Directory exists (ডিরেক্টরি আছে) |
| -s file | File size > 0                    |
| -x file | Executable                       |
| -r file | Readable                         |
| -w file | Writable                         |

---

## 🔹 Conditional Statements

- if, else, elif

```bash
read -p "Age: " age
if [ "$age" -lt 13 ]; then
  echo "Child"
elif [ "$age" -lt 20 ]; then
  echo "Teen"
else
  echo "Adult"
fi
```

- case

```bash
read -p "Enter choice (start|stop|status): " c
case "$c" in
  start)  echo "Starting service..." ;;
  stop)   echo "Stopping service..." ;;
  status) echo "Service is running." ;;
  *)      echo "Unknown option" ;;
esac
```

---

## 🔹 Loops

- for loop

```bash
for i in 1 2 3; do echo "Num: $i"; done
# Brace expansion
for i in {1..5}; do echo $i; done
```

- while loop

```bash
i=1
while [ $i -le 3 ]; do
  echo $i
  i=$((i+1))
done
```

- until loop

```bash
x=5
until [ $x -eq 0 ]; do
  echo $x
  x=$((x-1))
done
```

- break and continue

```bash
for i in {1..5}; do
  [ "$i" -eq 3 ] && continue
  [ "$i" -eq 4 ] && break
  echo $i
done
```

---

## 🔹 Functions

- Defining functions

```bash
hello() {
  echo "Hello $1"
}
hello "World"
```

- Returning values (use `echo` or exit code)

```bash
sum() { echo $(( $1 + $2 )); }
result=$(sum 5 7)
```

- Exit status as return (0=success)

```bash
is_even() { (( $1 % 2 == 0 )); }
if is_even 10; then echo "Even"; fi
```

---

## 🔹 Arrays

- Declaring arrays

```bash
arr=(apple banana cherry)
```

- Accessing

```bash
echo ${arr[1]}         # banana
echo ${#arr[@]}        # length
echo ${arr[@]}         # all elements
```

- Iterating

```bash
for item in "${arr[@]}"; do echo "$item"; done
```

- Associative arrays (Bash 4+)

```bash
declare -A ages=([Rafi]=25 [Sara]=22)
echo ${ages[Rafi]}
```

---

## 🔹 File Handling

- Redirection

```bash
echo "hello" > out.txt   # overwrite
echo "again" >> out.txt  # append
cat < out.txt            # stdin from file
```

- Pipes

```bash
cat /etc/passwd | grep bash | wc -l
```

- Common commands

  - `cat`, `touch`, `echo`, editors: `nano`, `vi`/`vim`

- Check file exists

```bash
[ -e file.txt ] && echo "exists" || echo "not found"
[ -f file.txt ] && echo "regular file"
[ -d dir ] && echo "directory"
```

---

## 🔹 Process Management

- Background process

```bash
long_task.sh &     # background
jobs               # list jobs
fg %1              # bring to foreground
bg %1              # resume in background
```

- ps, top, kill

```bash
ps aux | grep nginx
top                 # interactive
echo $!             # last background PID
kill -9 <pid>       # force kill (সতর্কতা)
```

- Exit status `$?`

```bash
some_cmd
if [ $? -eq 0 ]; then echo "Success"; else echo "Failed"; fi
```

Tip: Better—use `if some_cmd; then ... fi` to avoid `$?` directly.

---

## 🔹 Error Handling & Debugging

- Enable debug

```bash
set -x   # trace commands
# ... run your code ...
set +x   # turn off
```

- Fail fast (recommended)

```bash
set -euo pipefail
# -e: exit on error, -u: undefined var error, -o pipefail: propagate pipe failures
```

- Check exit status

```bash
if ls /tmp >/dev/null 2>&1; then
  echo "OK"
else
  echo "Error"
fi
```

---

## 🔹 Best Practices

- Shebang ব্যবহার করুন: `#!/usr/bin/env bash`
- `set -euo pipefail` ব্যবহার করুন production scripts-এ
- Variables quote করুন: `"$var"`
- Functions দিয়ে reusable blocks লিখুন
- Meaningful names, comments, consistent indentation
- Use shellcheck (static analysis) if possible

---

## 📋 Commonly Used Linux Commands (with examples)

নীচে Frequently-used commands + extra details দেয়া হলো:

### Files & Directories

```bash
pwd
ls -lah          # long, human-readable
cd /path/to/dir
mkdir -p logs/2025/08
rmdir empty_dir
rm -rf build/    # সতর্কতা: recursive force delete
cp -r src/ backup/src/
mv old.txt new.txt
touch app.log
stat app.log     # file details
```

### View & Page

```bash
cat file.txt
nl file.txt           # numbered lines
more file.txt
less +G file.txt      # jump to end
head -n 20 file.txt
tail -f app.log       # follow
```

### Search & Filter

```bash
grep -R "ERROR" logs/
grep -E "(WARN|ERROR)" app.log
find . -type f -name "*.sh"
locate bashrc | head
awk -F":" '{print $1}' /etc/passwd
sed -n '1,10p' file.txt
sed -E 's/foo/bar/g' file.txt
cut -d, -f1,3 data.csv
sort data.txt | uniq -c | sort -nr
tr '[:lower:]' '[:upper:]' < text.txt
xargs -I {} echo File: {}
```

### Permissions & Ownership

```bash
chmod +x script.sh
chmod 640 secret.txt
chown user:group file.txt
umask 022
```

### System & Processes

```bash
ps aux | less
top                     # or htop
free -h                 # memory
uptime
uname -a
whoami; id
vmstat 1 5
lsof -i :8080           # open files/sockets
```

### Archives & Compression

```bash
tar -czf backup.tgz folder/
tar -xzf backup.tgz -C /restore
gzip bigfile; gunzip bigfile.gz
zip -r site.zip site/; unzip site.zip
```

### Networking

```bash
ip addr show            # or ifconfig
ss -tulpen             # sockets
curl -I https://example.com
curl -s https://api.github.com | jq '.'
wget https://example.com/file
scp user@host:/path/file .
ssh user@host "hostnamectl"
```

### Disk & Usage

```bash
df -h                   # disk free
du -sh * | sort -h      # directory sizes
```

### Scheduling

```bash
crontab -e
# m h dom mon dow command
# 0 2 * * * /path/backup.sh >> /var/log/backup.log 2>&1
```

### Misc

```bash
date +%Y-%m-%d
echo "PATH=$PATH" | tee path.txt
seq 1 5 | paste -sd+ - | bc
nohup long.sh & disown
```

> Pro tip: Commands chain করতে `&&` (on success), `||` (on failure) ব্যবহার করুন।

---

## 🧑‍💻 Example Projects

### 1) Script to back up a folder (tar + date)

```bash
#!/usr/bin/env bash
set -euo pipefail
SRC_DIR=${1:-"./data"}
DEST_DIR=${2:-"./backups"}
mkdir -p "$DEST_DIR"
ts=$(date +%Y%m%d_%H%M%S)
archive="$DEST_DIR/backup_${ts}.tgz"

echo "Backing up $SRC_DIR -> $archive"
tar -czf "$archive" "$SRC_DIR"
echo "Done ✅"
```

Run:

```bash
./backup.sh ./myfolder ./backups
```

### 2) Script to check disk usage and send alert (console example)

```bash
#!/usr/bin/env bash
set -euo pipefail
THRESHOLD=${1:-80}
USAGE=$(df -h / | awk 'NR==2{gsub("%", "", $5); print $5}')
if [ "$USAGE" -ge "$THRESHOLD" ]; then
  echo "⚠️ Disk usage high: ${USAGE}% (threshold ${THRESHOLD}%)"
  # Optionally: send mail/slack/webhook here
else
  echo "✅ Disk usage OK: ${USAGE}%"
fi
```

### 3) Script to automate daily log saving

```bash
#!/usr/bin/env bash
set -euo pipefail
LOG_DIR="./logs"
mkdir -p "$LOG_DIR"
ts=$(date +%F)
log="$LOG_DIR/app_${ts}.log"
echo "[$(date +%T)] App started" >> "$log"
```

Add to cron (every day at 09:00):

```bash
0 9 * * * /path/to/daily_log.sh
```

---

## 📚 Resources

- GNU Bash manual (official): https://www.gnu.org/software/bash/manual/
- TLDP Advanced Bash-Scripting Guide: https://tldp.org/LDP/abs/html/
- man pages online: https://man7.org/linux/man-pages/
- Bash Hackers Wiki: https://wiki.bash-hackers.org/
- ShellCheck (linter): https://www.shellcheck.net/
- Cheat sheets:
  - https://devhints.io/bash
  - https://github.com/LeCoupa/awesome-cheatsheets

---

## ✅ Conclusion

Bash scripting হলো শক্তিশালী ও lightweight automation tool—files/processes/networking সবকিছু সহজে control করা যায়। Real-world এ এটি ব্যবহৃত হয় automation, DevOps CI/CD, server administration, monitoring, backups, data munging ইত্যাদিতে। Practice করুন, ছোট scripts লিখুন, এবং ধীরে ধীরে production-grade scripts build করুন. Happy scripting! 🚀
