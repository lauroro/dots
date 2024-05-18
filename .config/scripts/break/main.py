import os
import subprocess
import time


def send_notification(message):
    subprocess.Popen(["notify-send", message])


def play_sound():
    current_directory = os.path.dirname(os.path.abspath(__file__))
    sound = os.path.join(current_directory, "break.wav")
    subprocess.Popen(["aplay", sound])


def print_next_break(hour):
    print(f"Next break will be at {hour}:00")


def main():
    while True:
        send_notification("Time to take a break!")
        play_sound()
        time.sleep(8 * 60)


if __name__ == "__main__":
    main()
