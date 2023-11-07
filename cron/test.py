# open and write to file
with open("file.txt", "a") as file:
  file.writelines(["Hello world!\n", "Python is awesome!\n"])