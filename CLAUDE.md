# KyaUI

Addon de interfaz para **WoW Ascension / Conquest of Azeroth** (cliente 3.3.5a). Es un
*plugin de ElvUI*: no dibuja UI propia, sino que aplica perfiles y ajustes a ElvUI, xCT+,
Skada, DBM y WeakAuras mediante un asistente (`PluginInstaller` de ElvUI).

## Entorno — no negociable

- **Lua 5.1** y **API de WotLK 3.3.5a**. Nada de APIs de Retail (`C_*`, `SecureButton`
  moderno, `GetSpellInfo` con la firma nueva, etc.). Ante la duda, comprobar contra la API
  3.3.5a, no contra la documentación actual de Blizzard.
- `## Interface: 30300` en el `.toc`. El cliente es **custom**: existen addons propios de
  Ascension (`Ascension_NamePlates`, `Ascension_SkillCards`, `AscensionUI`…) que pueden
  chocar con ElvUI. `Modules/Nameplates.lua` ya gestiona uno de esos conflictos.
- **ElvUI no se empaqueta**: es dependencia (`## RequiredDeps: ElvUI`) y lo instala el usuario
  desde la pestaña *Addons* del Ascension Launcher, que reparte la **7.x**. El launcher también
  trae `ElvUI_OptionsUI`, `ElvUI_AddOnSkins`, `ElvUI_Enhanced` y `ElvUI_EnhancedFriendsList`,
  así que esos tampoco van en `vendor/`. Los plugins que sí van en `vendor/` (ProjectZidras,
  MicrobarEnhancement, DTBars2, CustomTweaks, CustomTags, DataTextColors) **sí están parcheados**
  para esta combinación: no actualizarlos desde upstream sin comprobar contra la 7.x.

## Estructura

```
KyaUI/                  el addon (esto es lo que se copia a Interface\AddOns)
  Code.lua              bootstrap: E:NewModule, detección de resolución, cola del asistente
  Load.xml              ORDEN DE CARGA — todo .lua nuevo debe registrarse aquí
  Core/                 defaults, install (páginas del asistente), commands (/kyaui, /kui)
  Modules/              CVar, Theme, Chat, Nameplates
  Media/                fuente SFUIDisplayCondensed-Semibold, textura Flatt, logo
  Profiles/             aplicadores (ElvUI.lua, Skada.lua…) + volcados (data_*.lua)
vendor/                 plugins de ElvUI que el launcher NO reparte, Skada, xCT+, BugSack
                        (no editar salvo parche deliberado para la 7.x — hay varios)
launcher/               KyaUI-Launcher.bat + KyaUI-Update.ps1 (autoactualizador desde GitHub)
tools/build.ps1         genera dist/KyaUI-Package.zip para repartir
```

`Load.xml` no usa carga automática: si añades un archivo y no lo listas ahí, **no se carga
y no hay error visible**. Los `data_*.lua` deben ir siempre antes de sus aplicadores.

## Convenciones del código

- El namespace global es `KyaUI`, creado en `Code.lua` con
  `E:NewModule(addonName, 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')`.
  Los demás archivos hacen `KyaUI = KyaUI or {}` y cuelgan funciones/tablas de ahí.
- `addonTable` lleva la config compartida: `Font`, `Texture`, `Resolution`
  (`FULL_HD` / `QUAD_HD`), `AceProfileName` (`"Nombre - Reino"`).
- La versión instalada se guarda en `E.private.KyaUI.install_version`. Subir `## Version`
  en el `.toc` dispara el aviso de actualización en `Code.lua`.
- **Todo el texto que ve el usuario va en inglés**: mensajes de `E:Print`, etiquetas de botón,
  `StaticPopupDialogs`, páginas del asistente, salidas de los comandos `/kyaui`. Los
  **comentarios van en español**. La UI del juego está en inglés y el paquete se reparte a
  gente que no habla español.
- Sin tildes ni caracteres no-ASCII dentro de los `.lua` (el cliente 3.3.5a los renderiza mal).
  Única excepción viva: los nombres de canal en ruso de `Modules/Chat.lua`, que son datos que
  deben coincidir literalmente. Este CLAUDE.md y el README sí llevan tildes.

## `Profiles/data_*.lua` — son generados

Son volcados de SavedVariables con la forma:

```lua
KyaUI.SkadaData = { ... }
```

**No se editan a mano.** El flujo correcto es: configurar en el juego → salir → regenerar
el volcado desde `WTF\Account\<CUENTA>\SavedVariables\<Addon>.lua` (ver
`tools/export-profiles.ps1`). Un diff enorme en `data_elvui.lua` (56 KB) o
`data_weakauras.lua` (114 KB) es normal y no hay que revisarlo línea a línea.

## Probar un cambio

1. El repo está enlazado al cliente con un junction, así que editar aquí ya afecta al juego:
   `...\resources\ascension-live\Interface\AddOns\KyaUI` → `D:\Games\KyaUI\KyaUI`
2. En el juego: `/reload`. Si tocaste el `.toc` o `Load.xml`, hace falta salir y volver a entrar.
3. `/kyaui` (o `/kui`) reabre el asistente. Errores de Lua en **BugSack**.
4. **Nunca tocar `WTF\` con el juego abierto**: WoW reescribe SavedVariables al salir y se
   pierden los cambios.

No hay tests automáticos ni linter; la verificación es siempre in-game.

## Al terminar un cambio

`tools/build.ps1` regenera `dist/KyaUI-Package.zip` (vendor + KyaUI + README) para repartir.
Ejecutarlo solo cuando se vaya a publicar una versión, no en cada commit.
