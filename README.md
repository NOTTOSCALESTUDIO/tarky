# Tarkov Story Route

An unofficial Escape from Tarkov guide where the story route runs in the background. Cycle through the tasks open on each map and pick whichever raid is most worth it, while the guide keeps the story and trader loyalty on track. Includes task tracking, a loot lookout list and live party sync.

**Live guide:** https://nottoscalestudio.github.io/tarky/ (installable as an app on Android, iPhone and desktop)

## Party and device sync

**What you need**
- Internet on every device, with the guide open at https://nottoscalestudio.github.io/tarky/ (live sync only connects from this address).
- Any current browser: Chrome, Edge, Safari or Firefox, on desktop or phone.

**Your own devices (PC + phone)**
1. On the device with your progress, open **Loot → Link device**.
2. Scan the QR code with your phone camera, or with no camera, copy or share the link and open it on the other device. It joins as you, and its checklist is replaced with yours. (The party code alone joins as a separate player.)
3. Checkmarks then sync both ways within about a second. If two devices change checkmarks at almost the same moment, the later change wins.

**Your party**
- **Invite** shows a QR code and link; friends who open it join your party.
- Everyone's open hand-ins merge into one colour-coded loot list, and coloured dots on a task show who has finished it.
- Turn **in my raid** off for members not raiding with you: found-in-raid items can only change hands in the same raid.
- Up to 12 connected devices per party. A party's shared data is deleted after 7 days with nobody connected and no updates; any activity restarts the clock. Each device keeps its own progress, and the first one back reopens the party under the same code.
- Party codes are 8 characters, shown as two groups of four (like K7QM-3XHP). The relay has protections against misuse.

**If a stranger ever got into your party** (very unlikely):
- They'd see what party members see: display names, open loot lists, checked tasks and route steps, and *in raid · map* while someone is raiding (unless they turn on streamer mode). If you stream PvP, use a display name that isn't your in-game name.
- They couldn't see account or profile numbers, log files, your network address or where you are. None of that is ever sent to the party.
- They couldn't change your progress. Your own devices recognise each other with a private key the party never sees, so nobody else can pose as one of them.
- At most they'd show up as an extra member with their own list. Start a new party and invite your friends again to leave them behind.

**Offline:** *Offline share* creates a share string friends can paste in, no connection needed.

### Game logs: automatic checking and raid status

> **⚠ Keep the guide open.** Logs are only read while the guide is open in a Chrome or Edge tab, or the installed app. It can sit minimized or in a background tab the whole time, but if it's closed, nothing gets checked off. Reopening it catches up on your last two game sessions; for longer gaps, use **Import past completions**.

Desktop Chrome or Edge on the PC running the game.
1. **Get the Logs folder somewhere Chrome can read it.** Chrome won't let websites read anything under Program Files, which is where Steam puts Tarkov by default. Pick the first option that fits:
   - **Official launcher, default install** (`C:\Battlestate Games\…`): it isn't under Program Files, so you can pick its Logs folder as is. Go to step 2.
   - **Steam, and you have a second drive or partition:** move the game there with Steam itself, no administrator needed. Steam → Settings → Storage → add a library folder on the other drive (a plain folder like `D:\Games\SteamLibrary`), select Escape from Tarkov and choose **Move**. Steam keeps updating it there. The move copies the whole game (50 GB+), so start it before a chore or before bed, and set your PC to sleep after a few hours rather than right away so it can finish. If the Battlestate launcher can't find the game afterwards, use its **Set path to existing game installation**.
   - **Steam on a single drive,** or you'd rather not move the game: download [Tarky-log-setup.bat](Tarky-log-setup.bat), right-click it and choose **Run as administrator**. It finds your Tarkov Logs folder and creates a hidden scheduled task that copies the three needed log files every minute into `C:\Users\<you>\TarkovLogs`. It asks how many days of copies to keep (default 30, or 0 for all): older copies are deleted every hour by a second hidden task, and aren't copied back. It never changes the game's files, installs no programs and doesn't use the internet; both tasks show in Windows' Task Scheduler, every line of the file is commented, and [Tarky-log-remove.bat](Tarky-log-remove.bat) undoes it. ([Why a setup file?](#steam-users-why-the-setup-file))

   **When none of these work:**
   - *Not enough free space:* Steam copies the game before deleting the old one, so the other drive needs room for a full copy during the move.
   - *Locked-down PCs* (shared, family, school or café machines) may block both new Steam library folders and the administrator step. Neither route helps there.
   - *A protected destination:* moving the game into another protected place (anywhere under Windows, Program Files or AppData) hits the same Chrome block. Use a plain folder.
   - *Single drive, no administrator rights:* Steam can't move the game within one drive, and the setup file needs an administrator once.
   - *Why not a second partition?* It works (Steam treats it as another drive), but creating one needs administrator rights too, and it should be about twice the install size so big updates have room to download. On one drive, the setup file is the simpler route.
   - *Firefox, Safari or a phone* can't read folders at all. Open the guide in Chrome or Edge on the gaming PC, connect there, and link your other devices to it to complete the automation process.
2. Tap **Game logs** in the bottom bar (or **Connect game logs** in the card at the top), and pick the game's own `build\Logs` folder, or `TarkovLogs` if you used the setup file.
3. From then on, tasks check themselves when the game logs them as completed, and your party sees *in raid · map* while you're in a raid (unless you turn on streamer mode). Checkmarks reach your phone and party through live sync.
4. Every session checks off tasks on the checklist of the account and mode that played it (see below). Tasks the guide doesn't have yet are listed from every mode, tagged with their mode, which is how new seasonal content gets noticed. To catch up, use **Import past completions** with the date of your last wipe or prestige. With the setup file, Import can only reach back as far as the copies you keep, so run it right after setup (or choose 0 days during setup, import, then run setup again with 30).

**One checklist per account and game mode:** each session's log records which account played and in which mode (PvE, PvP or a season), and the game keeps their progress separate, so the guide does too. It shows the checklist of your most recent session and switches by itself when someone else, or another mode, plays next. On a shared PC or with a seasonal character, progress never mixes. A **Checklist** picker in the Game logs panel lets you look at the others. Each checklist is a whole character: it also keeps its own party code, display name, faction, ending and hideout wishlist. When the guide switches to another account, this device moves to that account's party, and the previous character stays listed (offline) in its own party with its phone still linked.

Requirements and limits:
- Setup file only: if you aren't an administrator on your PC and someone else's admin login is used to run it, the copies land in *their* user folder instead of yours.
- Setup file only: it needs administrator rights once, because its task runs as SYSTEM: that keeps it hidden, with no window popping up over your game. Copies can lag the game by up to a minute.
- The game only writes to its logs between raids, so checkmarks arrive after you extract. Items you pick up are never logged, so loot counts stay manual. Logs don't uncheck anything.
- **The guide must stay open** (minimized or in a background tab is fine): see the note at the top of this section. Chrome checks background tabs about once a minute.
- Chrome may ask again for permission to read the folder after a restart; tap **Game logs → Allow again**.
- Only the push-notification, backend and application log files are read, on your PC. See [Your log data](#your-log-data).
- Task names come from [tarkov.dev](https://tarkov.dev/) (refreshed every few days).
- The Game logs panel also warns when your game is on a newer build than the guide was checked against, and lists tasks your game has started or finished that the guide doesn't include yet (hide event or edition-only ones with ×).

### Your log data

The game's logs hold more than the guide needs: account and profile numbers, game server addresses and request details. This is how that stays with you.

#### Steam users with the setup file

- **It stays on your PC.** The setup task copies files from one folder to another on the same PC with Windows' own copy tool (robocopy). Nothing in it touches the network.
- **Only three kinds of file are copied:** push-notifications, backend and application logs. Everything else in the Logs folder is left alone.
- **The copies are private.** They go into your own user folder, which only you and the PC's administrators can open.
- **They're kept only as long as you choose.** The cleanup task deletes copies older than the days you picked, every hour. [Tarky-log-remove.bat](Tarky-log-remove.bat) removes both tasks, and the log copies too if you say yes.

#### Everyone

- **Only this site can read the logs, and only inside your browser.** Chrome gives folder access to this one site, only after you pick the folder yourself. Turn it off any time with **Game logs → Disconnect**, or in Chrome's site settings. The guide reads the files on your PC; their contents are never sent anywhere. You can check this yourself: the whole guide is one open-source file, [index.html](https://github.com/nottoscalestudio/tarky/blob/main/index.html). Search it for `readNew` to see what's read from the logs, and `livePush` to see everything party sync sends.
- **What does leave your PC** is what party sync shares, and only if you've joined a party or linked a device: your display name, checked tasks and route steps, loot counts, and *in raid · map* (not with streamer mode on). Account and profile numbers stay on the device: the guide uses them only to keep each account's checklist separate.

### Steam users: why the setup file?

We tried the simpler routes first (tested Nov 17, 2026, Chrome on Windows):

1. **Pick the game's Logs folder directly.** Blocked: Chrome refuses to share any folder under Program Files with a website, however deep the folder is ("contains system files"). The rule covers the whole tree because Program Files holds installed programs, and a site with access there could read or overwrite them.
2. **A folder link (junction) from Documents to the Logs folder** (`mklink /J`). Blocked too: Chrome follows the link to where it really points and applies the same rule.
3. **Move the game out of Program Files.** Works, with no administrator needed, if you have a second drive: Steam's Storage manager moves it and keeps updating it there. But Steam allows one library folder per drive, so on a single-drive PC it can't be moved within C:. That's who the setup file is for.
4. **Copy the logs to a normal folder.** Works, and is what the setup file does. Details:
   - The copies go to `C:\Users\<you>\TarkovLogs`, a folder Chrome is allowed to read. Not Documents, because Documents is often synced to OneDrive and the logs contain session tokens.
   - Only the three log files the guide uses are copied: push-notifications (task events, raid status), backend (PvE or PvP) and application (which account was playing).
   - The task runs as SYSTEM so it stays hidden; a task under your own account would flash a window over the game every minute. That's why setup needs administrator rights once.
   - Old copies are cleaned up after the number of days you choose (default 30). The guide only reads the newest sessions, so older copies are just clutter once you've imported.
   - Paths are written into the task directly. An earlier version used Command Prompt variables, which silently stayed blank when pasted line by line.

## FAQ

**Does the guide touch the game?**
No. It never opens the game's own files, memory or network traffic. With Game logs on, Chrome or Edge just reads the text log files the game writes automatically, read-only, the same logs community tools such as [Tarkov Monitor](https://github.com/the-hideout/TarkovMonitor) read. See [Your log data](#your-log-data) for exactly what's read.

**Why a web page and not a program to install?**
So there's nothing to download, run or trust with your PC. Desktop trackers that read the logs are programs you install and run; this guide runs in the browser with no installer and no administrator rights, and updates itself. You can still install it as an app from Chrome or Edge's menu (per-user, no administrator needed). The whole guide is one open-source file, [index.html](https://github.com/nottoscalestudio/tarky/blob/main/index.html): read it yourself, or hand it to an AI to check for you.

**Does anything need administrator rights?**
Only Steam on a single drive: Chrome won't read Program Files, Steam can't move the game within one drive, so a one-time setup file copies the logs to your user folder. Official-launcher installs and Steam with a second drive need nothing. [Why a setup file?](#steam-users-why-the-setup-file) lists every route we tried first.

**Why do I still count items by hand?**
The logs don't record everything that happens. They note when a task starts, finishes or fails, and whether you're in a raid, but not items you pick up or hand in. So item counts stay manual until the game logs that task as completed; then it checks itself off and its items drop off your list.

**Why only Chrome or Edge on a PC?**
They're the browsers that let a web page read a folder you pick. Firefox, Safari and phones can use the guide, and can link to a PC that has the logs connected to get its checkmarks.

**Keyboard shortcuts?**
Press `/` from anywhere on the page to search the loot list ("do I need this?"), and again to close it. `Shift` + `/` (the ? key) lists the rest: L loot list, C current step, A any-map tasks, I item list, W wish lists, G gunsmith, 1–9 and 0 for the maps, Esc to close. The number pad, or Shift + 1–0, switches maps even while you type in the loot search; Enter there means done typing so the other keys work again. They only work while the guide's window has focus and you're not typing, so they never reach the game: with Tarkov in windowed or borderless mode, alt-tab to the guide, press a key, alt-tab back.

**What leaves my PC?**
Nothing from the logs. If you join a party or link a device, party sync shares the name you type (any name you like), checked tasks and route steps, loot needs and *in raid · map*. Account and profile numbers stay on your device. **Streamer mode** (in the party row of the loot list) stops sharing *in raid · map* entirely and keeps party codes, invite links and QR codes covered on screen until you click or tap them.

Could a stranger land in your party? Party codes are 8 characters from 32 letters and digits, about 1.1 trillion combinations, so not by chance: joining takes the code or your invite link, the relay turns away repeated guessing, and an empty party's code expires. To go quiet for a while, **Leave**, then rejoin from Recent parties with one tap.

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
