# KyaUI — Instalación (para amigos)

UI de Kyaro para **Conquest of Azeroth / Ascension** (basada en ElvUI). Instalador con asistente
que configura ElvUI, xCT+, Skada y DBM con un click.

## 1. Requisitos (addons que deben estar en `Interface\AddOns`)
- **ElvUI** (versión parcheada para el cliente custom — incluida en el paquete) + sus plugins:
  `ElvUI_Enhanced`, `ElvUI_ProjectZidras`, `ElvUI_AddOnSkins`, `ElvUI_DTBars2`, `ElvUI_CustomTweaks`,
  `ElvUI_OptionsUI`, etc.
- **xCT+** (texto de combate), **Skada** (medidor), **DBM-Core** (avisos de jefes).
- **KyaUI** (este addon).

> IMPORTANTE: usa el **ElvUI del paquete** (lleva los arreglos del cliente custom de Ascension).
> Un ElvUI normal dará errores de Lua en CoA.

## 2. Copiar y activar
1. Cierra el juego.
2. Copia todas las carpetas a `...\resources\ascension-live\Interface\AddOns\`.
3. En la pantalla de personajes → **AddOns** → activa **"Load out of date AddOns"** y verifica
   que ElvUI, KyaUI y los demás están marcados.

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
