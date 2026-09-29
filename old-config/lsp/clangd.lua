return {
  cmd = {
    "clangd",
    "--background-index",
    "--query-driver=/home/topi/.platformio/packages/toolchain-xtensa-esp32s3/bin/xtensa-esp32s3-elf-*",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_markers = {
    ".clangd",
    "compile_commands.json",
    "compile_flags.txt",
    ".git",
  },
}
