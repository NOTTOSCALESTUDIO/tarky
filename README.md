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
- Up to 12 connected devices per party. A party's shared data is deleted 12 hours after its last activity; each device keeps its own progress.

**Offline:** *Offline share* creates a share string friends can paste in, no connection needed.

**Game logs: automatic ticking and raid status** (desktop Chrome or Edge on the PC running the game)
1. Tap **Game logs** in the bottom bar, then **Choose Logs folder**, and pick `Escape from Tarkov\build\Logs`.
2. From then on, tasks tick themselves when the game logs them as completed, and your party sees *in raid · map* while you're in a raid. Ticks reach your phone and party through live sync.
3. Choose whether completions count from PvE sessions, PvP sessions or both. To catch up, use **Import past completions** with the date of your last wipe or prestige.

Requirements and limits:
- **The game must not be installed under Program Files.** Chrome refuses to share that folder with websites. Move the game to a Steam library elsewhere (Steam → game Properties → Installed Files → Move install folder), for example `C:\Games\SteamLibrary`.
- The game only writes to its logs between raids, so ticks arrive after you extract. Items you pick up are never logged, so loot counts stay manual. Logs don't untick anything.
- The guide must stay open in a tab or the installed app. Chrome checks background tabs about once a minute.
- Chrome may ask again for permission to read the folder after a restart; tap **Game logs → Allow again**.
- Only the push-notification and backend log files are read, on your PC. Nothing is uploaded except your ticks and raid status.
- Task names come from [tarkov.dev](https://tarkov.dev/) (refreshed every few days).
- The Game logs panel also warns when your game is on a newer build than the guide was checked against, and lists tasks your game has started or finished that the guide doesn't include yet (hide event or edition-only ones with ×).

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
