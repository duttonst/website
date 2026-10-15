# www.obdura.com website
- Perform all edits in VSCode with Codex
- To turn-over a new version:
1. Clone to a local filesystem
2. From the project root, create a fresh deployment archive:

   ```sh
   rm -f home.zip && COPYFILE_DISABLE=1 zip -r home.zip home .htaccess -x '*.DS_Store' '*/._*' '__MACOSX/*' '*/__MACOSX/*' '*/.Spotlight-V100/*' '*/.Trashes/*' '*/.fseventsd/*'
   ```

   This includes `home/` and the root `.htaccess`, excludes macOS metadata, and replaces the old archive so deleted files are not retained.

3. Upload `home.zip` to `public_html`.
4. Uncompress it there, including the root `.htaccess`.
That's it.
