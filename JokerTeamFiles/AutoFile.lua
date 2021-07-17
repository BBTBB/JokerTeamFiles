local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
FFMFF_Team(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
FFMFFTeam:del(JokerTeam.."Team:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
FFMFF_Team(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
FFMFFTeam:set(JokerTeam.."Team:Lock:AutoFile",true) 
end 
end

if (text and not FFMFFTeam:get(JokerTeam.."Team:Lock:AutoFile")) then
Time = FFMFFTeam:get(JokerTeam.."Team:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = FFMFFTeam:smembers(JokerTeam..'Team:Groups') 
local BotName = (FFMFFTeam:get(JokerTeam.."Team:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..JokerTeam..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = FFMFFTeam:get(JokerTeam.."Team:Groups:Links"..v)
Welcomes = FFMFFTeam:get(JokerTeam..'Team:Groups:Welcomes'..v) or ''
TeamConstructors = FFMFFTeam:smembers(JokerTeam..'Team:TeamConstructor:'..v)
BasicConstructors = FFMFFTeam:smembers(JokerTeam..'Team:BasicConstructor:'..v)
Constructors = FFMFFTeam:smembers(JokerTeam..'Team:Constructor:'..v)
Managers = FFMFFTeam:smembers(JokerTeam..'Team:Managers:'..v)
Admis = FFMFFTeam:smembers(JokerTeam..'Team:Admins:'..v)
Vips = FFMFFTeam:smembers(JokerTeam..'Team:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #TeamConstructors ~= 0 then
GetJson = GetJson..'"TeamConstructors":['
for k,v in pairs(TeamConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..JokerTeam..'.json', "w")
File:write(GetJson)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id='..FFMFFId..'" -F "document=@'..JokerTeam..'.json' .. '" -F "caption=⌁︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..JokerTeam..'.json')
FFMFFTeam:set(JokerTeam.."Team:AutoFile:Time",os.date("%x"))
end
else 
FFMFFTeam:set(JokerTeam.."Team:AutoFile:Time",os.date("%x"))
end
end

end
return {
JokerTeam = AutoFile
}
