# KyaUI — Instalación (para amigos)

UI de Kyaro para **Conquest of Azeroth / Ascension** (basada en ElvUI). Instalador con asistente
que configura ElvUI, xCT+, Skada y DBM con un click.

## 1. Instala ElvUI primero (obligatorio)

**Ascension Launcher → pestaña "Addons" → ElvUI → Install.**

KyaUI es un *plugin* de ElvUI: sin él no carga (sale como dependencia ausente).

> El paquete **ya no incluye ElvUI**. Antes sí, pero el launcher reparte una versión más nueva
> (7.x) y las dos se pisaban. Ahora se usa la del launcher, que además se actualiza sola.
> Junto con ElvUI, el launcher instala `ElvUI_OptionsUI`, `ElvUI_AddOnSkins`, `ElvUI_Enhanced`
> y `ElvUI_EnhancedFriendsList`, así que esos tampoco vienen en el ZIP.

El resto sí va en el paquete: `ElvUI_ProjectZidras`, `ElvUI_DTBars2`, `ElvUI_CustomTweaks`,
`ElvUI_CustomTags`, `ElvUI_DataTextColors`, `ElvUI_MicrobarEnhancement`, además de **xCT+**
(texto de combate), **Skada** (medidor) y **BugSack**. **DBM-Core** (avisos de jefes) se instala
aparte — ver la sección de opcionales.

## 2. Copiar y activar
1. Cierra el juego.
2. Copia todas las carpetas a `...\resources\ascension-live\Interface\AddOns\`.
3. En la pantalla de personajes → **AddOns** → activa **"Load out of date AddOns"** y verifica
   que ElvUI, KyaUI y los demás están marcados.

## 2b. Actualizar (automático)

Abre el juego con **`KyaUI-Launcher.bat`** (viene en el ZIP; puedes dejarlo donde quieras y
crearle un acceso directo). Antes de arrancar Ascension comprueba si hay una versión nueva
publicada y la instala sola.

- La primera vez localiza tu instalación de Ascension y la recuerda en `kyaui-launcher.json`.
- **No toca `WTF\`**: tus perfiles, keybinds y macros se quedan igual.
- Solo reemplaza las carpetas que vienen en el paquete — los addons que hayas añadido tú no se
  tocan, y **ElvUI tampoco** (lo sigue actualizando el Ascension Launcher).
- Deja una copia de lo anterior en `...\KyaUI-backups\<fecha>\` (guarda las 2 últimas).
- El juego debe estar **cerrado**; si está abierto, avisa y no toca nada.

Opciones para probar sin instalar nada: `KyaUI-Launcher.bat -CheckOnly` (solo informa) y
`-NoLaunch` (actualiza pero no abre el juego).

## 3. Primer arranque (desde cero)
1. Entra al juego. **El asistente de KyaUI se abre directamente** — KyaUI hace que ElvUI se salte
   su propio instalador, así que NO tienes que darle "Skip Process".
   (Si por algo no aparece, escribe **`/kyaui`**.)

## 4. Recorre el asistente de KyaUI (en orden)
1. **CVars** → Setup CVars
2. **Apply KyaUI** → aplica la interfaz (layout, fuentes, nameplates, filtro Defensivos)
3. **Theme** → Class Colors o Dark Mode
4. **Chat** → Setup Chat (ordena las ventanas; los canales globales van a GLB)
5. **xCT+** → elige **Healer** o **DPS/Tank** según tu rol
6. **Skada** → Apply Skada
7. **DBM** → Apply DBM
8. **Finished** → recarga y aplica todo

## Notas
- **Nameplates**: KyaUI apaga la opción "Use Ascension NamePlates" (CVar `useNewNameplates`) para
  que ElvUI las estilice. Si el cliente la re-activa, KyaUI la vuelve a apagar al entrar (popup de reload).
- **Re-abrir el asistente**: `/kyaui` (o `/kui`).
- **NO incluye nada de clase** (sin HoTs ni WeakAuras): es una base limpia; cada quien añade lo suyo.
- Los **keybinds** son por personaje (no se comparten): ponlos tú.
