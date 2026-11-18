# Tarkov Story Route

An unofficial Escape from Tarkov guide: story progression plus a trader-loyalty routing plan, with task tracking, a loot lookout list and live party sync.

**Live guide:** https://nottoscalestudio.github.io/tarky/ (installable as an app on Android, iPhone and desktop)

## Party and device sync

**What you need**
- Internet on every device, with the guide open at https://nottoscalestudio.github.io/tarky/ (live sync only connects from this address).
- Any current browser: Chrome, Edge, Safari or Firefox, on desktop or phone.

**Your own devices (PC + phone)**
1. On the device with your progress, open **Loot → Link device**.
2. Scan the QR code with your phone camera (or open the link on another PC). It joins as you, and its checklist is replaced with yours.
3. Ticks then sync both ways within about a second. If two devices change ticks at almost the same moment, the later change wins.

**Your party**
- **Invite** shows a QR code and link; friends who open it join your party.
- Everyone's open hand-ins merge into one colour-coded loot list, and coloured dots on a task show who has finished it.
- Turn **in my raid** off for members not raiding with you: found-in-raid items can only change hands in the same raid.
- Up to 12 connected devices per party. A party's shared data is deleted after 7 days with nobody connected and no updates; any activity restarts the clock. Each device keeps its own progress, and the first one back reopens the party under the same code.
- Party codes are 8 characters, shown as two groups of four (like K7QM-3XHP). The relay has protections against misuse.

**If a stranger ever got into your party** (very unlikely):
- They'd see what party members see: display names, open loot lists, ticked tasks and route steps, and *in raid · map* while someone is raiding. If you stream PvP, use a display name that isn't your in-game name.
- They couldn't see account or profile numbers, log files, your network address or where you are. None of that is ever sent to the party.
- They couldn't change your progress. Your own devices recognise each other with a private key the party never sees, so nobody else can pose as one of them.
- At most they'd show up as an extra member with their own list. Start a new party and invite your friends again to leave them behind.

**Offline:** *Offline share* creates a share string friends can paste in, no connection needed.

**Game logs: automatic ticking and raid status** (desktop Chrome or Edge on the PC running the game)
1. **Steam players:** Chrome won't let websites read anything under Program Files, where Steam installs Tarkov (moving the game doesn't help on a single drive, since Steam allows one library per drive). Download [Tarky-log-setup.bat](Tarky-log-setup.bat), right-click it and choose **Run as administrator**. It finds your Tarkov Logs folder and creates a hidden scheduled task that copies the three needed log files every minute into `C:\Users\<you>\TarkovLogs`. It asks how many days of copies to keep (default 30, or 0 for all): older copies are deleted every hour by a second hidden task, and aren't copied back. It never changes the game's files; [Tarky-log-remove.bat](Tarky-log-remove.bat) undoes it. ([Why a setup file?](#why-the-setup-file)) **Game installed outside Program Files** (official launcher, or another drive): skip this.
2. Tap **Game logs** in the bottom bar, then **Choose Logs folder**, and pick `TarkovLogs` (or the game's own `Logs` folder if you skipped step 1).
3. From then on, tasks tick themselves when the game logs them as completed, and your party sees *in raid · map* while you're in a raid. Ticks reach your phone and party through live sync.
4. Every session ticks the checklist of the account and mode that played it (see below). Tasks the guide doesn't have yet are listed from every mode, tagged with their mode, which is how new seasonal content gets noticed. To catch up, use **Import past completions** with the date of your last wipe or prestige. With the setup file, Import can only reach back as far as the copies you keep, so run it right after setup (or choose 0 days during setup, import, then run setup again with 30).

**One checklist per account and game mode:** each session's log records which account played and in which mode (PvE, PvP or a season), and the game keeps their progress separate, so the guide does too. It shows the checklist of your most recent session and switches by itself when someone else, or another mode, plays next. On a shared PC or with a seasonal character, progress never mixes. A **Checklist** picker in the Game logs panel lets you look at the others. Each checklist is a whole character: it also keeps its own party code, display name, faction, ending and hideout wishlist. When the guide switches to another account, this device moves to that account's party, and the previous character stays listed (offline) in its own party with its phone still linked.

Requirements and limits:
- If you aren't an administrator on your PC and someone else's admin login is used to run the setup file, the copies land in *their* user folder instead of yours.
- The setup file needs administrator rights once, because its task runs as SYSTEM: that keeps it hidden, with no window popping up over your game. Copies can lag the game by up to a minute.
- The game only writes to its logs between raids, so ticks arrive after you extract. Items you pick up are never logged, so loot counts stay manual. Logs don't untick anything.
- The guide must stay open in a tab or the installed app. Chrome checks background tabs about once a minute.
- Chrome may ask again for permission to read the folder after a restart; tap **Game logs → Allow again**.
- Only the push-notification, backend and application log files are read, on your PC. See [Your log data](#your-log-data).
- Task names come from [tarkov.dev](https://tarkov.dev/) (refreshed every few days).
- The Game logs panel also warns when your game is on a newer build than the guide was checked against, and lists tasks your game has started or finished that the guide doesn't include yet (hide event or edition-only ones with ×).

### Your log data

The game's logs hold more than the guide needs: account and profile numbers, game server addresses and request details. This is how that stays with you:

- **It stays on your PC.** The setup task copies files from one folder to another on the same PC with Windows' own copy tool (robocopy). Nothing in it touches the network.
- **Only three kinds of file are copied:** push-notifications, backend and application logs. Everything else in the Logs folder is left alone.
- **The copies are private.** They go into your own user folder, which only you and the PC's administrators can open.
- **They're kept only as long as you choose.** The cleanup task deletes copies older than the days you picked, every hour. [Tarky-log-remove.bat](Tarky-log-remove.bat) removes both tasks and, if you say yes, the copies too.
- **Only this site can read them, and only inside your browser.** Chrome gives folder access to this one site, only after you pick the folder yourself. Turn it off any time with **Game logs → Disconnect**, or in Chrome's site settings. The guide reads the files on your PC; their contents are never sent anywhere. You can check this yourself: the whole guide is one open-source file, [index.html](https://github.com/nottoscalestudio/tarky/blob/main/index.html). Search it for `readNew` to see what's read from the logs, and `livePush` to see everything party sync sends.
- **What does leave your PC** is what party sync shares, and only if you've joined a party or linked a device: your display name, ticked tasks and route steps, loot counts, and *in raid · map*. Account and profile numbers stay on the device: the guide uses them only to keep each account's checklist separate.

### Why the setup file?

We tried the simpler routes first (tested Nov 17, 2026, Chrome on Windows):

1. **Pick the game's Logs folder directly.** Blocked: Chrome refuses to share any folder under Program Files with a website, however deep the folder is ("contains system files"). The rule covers the whole tree because Program Files holds installed programs, and a site with access there could read or overwrite them.
2. **A folder link (junction) from Documents to the Logs folder** (`mklink /J`). Blocked too: Chrome follows the link to where it really points and applies the same rule.
3. **Move the game out of Program Files.** Works only if you have a second drive: Steam allows one library folder per drive, so on a single-drive PC it can't be moved within C:.
4. **Copy the logs to a normal folder.** Works, and is what the setup file does. Details:
   - The copies go to `C:\Users\<you>\TarkovLogs`, a folder Chrome is allowed to read. Not Documents, because Documents is often synced to OneDrive and the logs contain session tokens.
   - Only the three log files the guide uses are copied: push-notifications (task events, raid status), backend (PvE or PvP) and application (which account was playing).
   - The task runs as SYSTEM so it stays hidden; a task under your own account would flash a window over the game every minute. That's why setup needs administrator rights once.
   - Old copies are cleaned up after the number of days you choose (default 30). The guide only reads the newest sessions, so older copies are just clutter once you've imported.
   - Paths are written into the task directly. An earlier version used Command Prompt variables, which silently stayed blank when pasted line by line.

## Report a problem

**Report a problem** at the bottom of the guide sends a short report of your setup and what the guide saw: guide and game version, browser, whether Game logs and party sync are working and their last error, recent page errors, and the task lines the guide read from your last two game sessions. You don't need to describe anything, and an optional note can be in any language. Account and profile numbers, party codes, names and whole log files are never included; tap *See exactly what will be sent* to check before sending. Reports go to a private issue tracker only the author can read. If sending isn't possible, **Save as file** gives you the same report to attach wherever you get in touch.

## Licences

- **Code** (HTML, CSS, JavaScript, service worker): [GPL-3.0](LICENSE).
- **Task text** adapted from the [Escape from Tarkov Wiki](https://escapefromtarkov.fandom.com/) (Fandom): [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/). Reuse it with credit, under the same licence.
- Item and reputation data from [tarkov.dev](https://tarkov.dev/).

### Additional terms (GPL-3.0 section 7)

As permitted by section 7 of the GNU General Public License v3.0, the copyright holder adds these terms to the code in this repository:

- **7(c) Modified versions must be marked.** Anyone who distributes a modified version must mark it in a reasonable way as different from the original, for example with a different name and a visible note that it is a modified version of Tarkov Story Route. You may not misrepresent the origin of this material.
- **7(e) Names and branding.** This licence grants no rights under trademark law to use the names "Tarkov Story Route", "Tarky" or "nottoscalestudio", or this project's icons and logos. You may state accurately that a modified version is based on Tarkov Story Route, but you may not use those names or marks to name, brand or promote a modified version or suggest it is endorsed by the original author.
- **7(f) Indemnification.** Anyone who conveys this material, or modified versions of it, with contractual assumptions of liability to the recipient must indemnify the licensors and authors of this material for any liability that those contractual assumptions directly impose on the licensors and authors.

These terms apply to the code. Wiki-derived task text stays under CC BY-SA 3.0 as described above.

Unofficial fan project. Not affiliated with or endorsed by Battlestate Games. "Escape from Tarkov" and related names, art and content are trademarks and copyrights of Battlestate Games.

## Support

https://ko-fi.com/nottoscalestudio
