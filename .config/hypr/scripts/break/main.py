import os
import subprocess
import time


def main():
    while True:
        subprocess.Popen(
            ["notify-send", "-u", "critical", "Time to take a break!", ":)"]
        )

        current_directory = os.path.dirname(os.path.abspath(__file__))
        sound = os.path.join(current_directory, "break.wav")
        subprocess.Popen(["aplay", "--quiet", sound])
        time.sleep(6 * 60)


if __name__ == "__main__":
    main()
