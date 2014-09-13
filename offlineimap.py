import subprocess

def get_fastmail_password():
    pw = subprocess.check_output(["pass", "show", "fastmail"])
    return str(pw).strip()
