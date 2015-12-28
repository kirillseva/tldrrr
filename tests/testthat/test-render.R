context("render")

tar <- "# tar\n\n> Archiving utility\n> Optional compression with gzip / bzip\n\n- create an archive from files\n\n`tar cf {{target.tar}} {{file1 file2 file3}}`\n\n- create a gzipped archive\n\n`tar czf {{target.tar.gz}} {{file1 file2 file3}}`\n\n- extract an archive in a target folder\n\n`tar xf {{source.tar}} -C {{folder}}`\n\n- extract a gzipped archive in the current directory\n\n`tar xzf {{source.tar.gz}}`\n\n- extract a bzipped archive in the current directory\n\n`tar xjf {{source.tar.bz2}}`\n\n- create a compressed archive, using archive suffix to determine the compression program\n\n`tar caf {{target.tar.xz}} {{file1 file2 file3}}`\n\n- list the contents of a tar file\n\n`tar -tvf {{source.tar}}`\n"
hello_error <- "Page not found. This is your chance to contribute to open source!\n\nSubmit a pull request to: https://github.com/tldr-pages/tldr with instructions on how to use hello"

test_that('if record is not found, returns a friendly message', {
  expect_output(render('Not Found', 'hello'), hello_error)
})
