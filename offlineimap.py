import subprocess

def get_fastmail_password():
    pw = subprocess.check_output(["pass", "show", "fastmail/offlineimap"])
    return str(pw).strip()
