The tar command in Linux is used to create, manage, and extract archives. 

Here are 50 comprehensive use cases of the tar command in Linux, explained step-by-step for users at different levels: beginner, intermediate, and advanced.


---

🟢 Beginner Use Cases

1. Create a .tar archive (uncompressed)

'''
tar -cvf archive.tar file1 file2
'''
-c: Create a new archive.

-v: Verbosely list files being archived.

-f: Specify the archive file name.

This command archives file1 and file2 into archive.tar.


2. List contents of a .tar archive

tar -tvf archive.tar

-t: List the contents of the archive.

This shows the list of files inside archive.tar.



3. Extract a .tar archive

tar -xvf archive.tar

-x: Extract files from the archive.

Extracts all the files in archive.tar to the current directory.



4. Compress files to a .tar.gz archive

tar -czvf archive.tar.gz file1 file2

-z: Compress the archive using gzip.

Creates a compressed archive archive.tar.gz.



5. Extract a .tar.gz archive

tar -xzvf archive.tar.gz

-x: Extract.

-z: Decompress using gzip.

Extracts archive.tar.gz to the current directory.



6. Create a .tar.bz2 archive

tar -cjvf archive.tar.bz2 file1 file2

-j: Compress using bzip2.

Creates a compressed archive archive.tar.bz2.



7. Extract a .tar.bz2 archive

tar -xjvf archive.tar.bz2

-j: Decompress using bzip2.

Extracts archive.tar.bz2 to the current directory.



8. Create a .tar.xz archive

tar -cJvf archive.tar.xz file1 file2

-J: Compress using xz.

Creates archive.tar.xz.



9. Extract a .tar.xz archive

tar -xJvf archive.tar.xz

-J: Decompress using xz.

Extracts archive.tar.xz files.



10. Archive an entire directory

tar -cvf archive.tar /path/to/directory

Archives all contents of the specified directory.



11. Extract to a specific directory

tar -xvf archive.tar -C /destination/path

-C: Change to the specified directory before extraction.



12. View files without extracting

tar -tf archive.tar

Lists the archive contents without extracting them.



13. Add files to an existing .tar archive

tar -rvf archive.tar newfile.txt

-r: Append files to the archive.

Only works for uncompressed .tar files.



14. Check the size of an archive

tar -czvf - file1 file2 | wc -c

Compresses file1 and file2 and pipes the output to wc -c to count the size in bytes.



15. Create a backup with a timestamp

tar -cvf backup_$(date +%F).tar /path/to/data

Adds a timestamp to the archive name.





---

🟡 Intermediate Use Cases

16. Exclude specific files when creating an archive

tar -cvf archive.tar --exclude="*.log" /path/to/dir

Excludes all .log files during archiving.



17. Compress multiple directories

tar -czvf archive.tar.gz dir1 dir2 dir3

Archives and compresses multiple directories.



18. Extract a single file from an archive

tar -xvf archive.tar file1

Extracts file1 only.



19. Verify the integrity of an archive

tar -tvf archive.tar --verify

Checks if the archive contents are readable and consistent.



20. Create an archive of hidden files

tar -cvf archive.tar /path/to/dir/.* /path/to/dir/*

Includes hidden files (those starting with .).



21. Extract without overwriting existing files

tar -xvkf archive.tar

-k: Keep existing files; skip overwriting.



22. Extract specific file types

tar -xvf archive.tar --wildcards "*.txt"

Extracts all .txt files.



23. Archive and compress with gzip while preserving permissions

tar -czvpf archive.tar.gz /path/to/dir

-p: Preserve file permissions.



24. Extract files matching a pattern

tar -xvf archive.tar --wildcards 'subdir/*.log'

Extracts files with .log extension inside subdir.



25. Change archive verbosity

tar -cf archive.tar file1 file2

Creates an archive without verbose output.



26. Update files in an archive

tar -uvf archive.tar file1

-u: Updates file1 if it’s newer.



27. Delete files from an uncompressed .tar archive

tar --delete -vf archive.tar file1

Deletes file1 from archive.tar.



28. Create an archive with absolute paths

tar -cvf archive.tar /home/user/file.txt

Keeps the absolute path in the archive.



29. Create an archive without absolute paths

tar -cvf archive.tar -C /home/user file.txt

Changes to /home/user before archiving file.txt.



30. Compress with the highest compression level

tar -czvf archive.tar.gz --options gzip:compression-level=9 file1

Maximizes compression for gzip.





---

🔴 Advanced Use Cases

31. Split large archives into smaller parts

tar -cvf - /path/to/dir | split -b 100M - archive_part_

Splits the archive into 100 MB parts.



32. Combine split archives

cat archive_part_* > combined.tar

Reconstructs the archive from parts.



33. Extract from standard input

cat archive.tar | tar -xvf -

Extracts archive data piped from cat.



34. Backup and compress to remote server

tar -czvf - /path/to/dir | ssh user@remote "cat > backup.tar.gz"

Sends backup to a remote server over SSH.



35. Use tar with find

find /path/to/dir -name "*.txt" | tar -cvf archive.tar -T -

Archives all .txt files found by find.



36. Create a compressed archive with encryption

tar -czvf - file1 file2 | openssl enc -aes-256-cbc -out secure.tar.gz.enc

Encrypts the archive using openssl.



37. Decrypt and extract an encrypted archive

openssl enc -d -aes-256-cbc -in secure.tar.gz.enc | tar -xzvf -


38. Extract a specific directory from an archive

tar -xvf archive.tar path/to/extract/


39. Create a differential backup

tar -cvf backup.tar --newer="2024-06-01" /path/to/dir

Archives files modified since June 1, 2024.



40. Check archive compression ratio

du -h archive.tar.gz archive.tar


41. Compress using zstd

tar -I zstd -cvf archive.tar.zst file1


42. Extract a .tar.zst archive

tar -I zstd -xvf archive.tar.zst

-I zstd: Uses zstd decompression for extracting.



43. Create a .tar archive using parallel compression with pigz

tar --use-compress-program=pigz -cvf archive.tar.gz /path/to/dir

pigz (parallel implementation of gzip) speeds up compression.



44. Extract a specific file to a different directory

tar -xvf archive.tar file.txt -C /destination/path

Extracts file.txt to /destination/path.



45. Create a compressed archive and calculate the checksum

tar -czvf archive.tar.gz file1 && sha256sum archive.tar.gz

Creates a checksum for verifying archive integrity.



46. List archive contents with detailed file information

tar -tvf archive.tar --full-time

Displays full timestamps and details.



47. Use tar with xargs to archive many files

find /path -name "*.log" | xargs tar -cvf logs_archive.tar

Archives all .log files found by find and passed via xargs.



48. Extract files without restoring permissions

tar --no-same-permissions -xvf archive.tar

Extracts files using default user permissions.



49. Create an archive while excluding files by size

tar -cvf archive.tar --exclude-from=<(find /path -size +100M) /path

Excludes files larger than 100 MB during archiving.



50. Show progress during compression using pv

tar -cvf - /path/to/dir | pv | gzip > archive.tar.gz

pv: Shows progress of data transfer and compression.





---

Conclusion

These 50 use cases cover everything from basic archiving to advanced automation and encryption. If this helped you expand your Linux skills, don’t forget to like, follow, and subscribe for more tips and tutorials!


