# www.obdura.com website
- Perform all edits in VSCode with Codex
- To turn-over a new version:
1. Clone to a local filesystem.
2. Double-click `package.command` in Finder to create a fresh deployment archive. Alternatively, run it from the project root:

   ```sh
   ./package.command
   ```

   This creates `home.zip` in the project root containing the enclosing `home/` directory and the root `.htaccess`. It excludes macOS metadata, and replaces the old archive only after packaging succeeds. The script can also be run from another directory using its full path.

3. Upload `home.zip` to `public_html`.
4. In cPanel File Manager, select `home.zip`, click **Extract**, and set the destination to `public_html` (not `public_html/home`). The archive itself supplies the `home/` directory.
5. Confirm the resulting paths are `public_html/home/index.html` and `public_html/.htaccess`. Enable **Settings → Show Hidden Files (dotfiles)** in cPanel to see `.htaccess`.

That's it.
