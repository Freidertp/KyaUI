-- KyaUI: registra las fuentes/texturas propias en LibSharedMedia (auto-contenido).
-- El perfil de KyaUI referencia estos nombres, asi que deben estar registrados.
local LSM = LibStub and LibStub('LibSharedMedia-3.0', true)
if not LSM then return end

LSM:Register('font', 'SFUIDisplayCondensed-Semibold', [[Interface\AddOns\KyaUI\Media\fonts\SFUIDisplayCondensed-Semibold.ttf]])
LSM:Register('statusbar', 'Flatt', [[Interface\AddOns\KyaUI\Media\textures\Flatt.blp]])
