
import os

def file_most_recent(path):
    files = os.listdir(path)
    paths = [os.path.join(path, basename) for basename in files]
    file = max(paths, key=os.path.getctime)
    return file

