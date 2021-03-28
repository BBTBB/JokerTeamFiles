local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Abbas(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevAbbas:del(Joker.."Abbas:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Abbas(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevAbbas:set(Joker.."Abbas:Lock:AutoFile",true) 
end 
end

if (text and not DevAbbas:get(Joker.."Abbas:Lock:AutoFile")) then
Time = DevAbbas:get(Joker.."Abbas:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevAbbas:smembers(Joker..'Abbas:Groups') 
local BotName = (DevAbbas:get(Joker.."Abbas:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..Joker..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevAbbas:get(Joker.."Abbas:Groups:Links"..v)
Welcomes = DevAbbas:get(Joker..'Abbas:Groups:Welcomes'..v) or ''
AbbasConstructors = DevAbbas:smembers(Joker..'Abbas:AbbasConstructor:'..v)
BasicConstructors = DevAbbas:smembers(Joker..'Abbas:BasicConstructor:'..v)
Constructors = DevAbbas:smembers(Joker..'Abbas:Constructor:'..v)
Managers = DevAbbas:smembers(Joker..'Abbas:Managers:'..v)
Admis = DevAbbas:smembers(Joker..'Abbas:Admins:'..v)
Vips = DevAbbas:smembers(Joker..'Abbas:VipMem:'..v)
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
if #AbbasConstructors ~= 0 then
GetJson = GetJson..'"AbbasConstructors":['
for k,v in pairs(AbbasConstructors) do
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
local File = io.open('./'..Joker..'.json', "w")
File:write(GetJson)
File:close()
local abbas1 = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas1 .. '" -F "chat_id='..FFMFF..'" -F "document=@'..Joker..'.json' .. '" -F "caption=⌁︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..Joker..'.json')
DevAbbas:set(Joker.."Abbas:AutoFile:Time",os.date("%x"))
end
else 
DevAbbas:set(Joker.."Abbas:AutoFile:Time",os.date("%x"))
end
end

end
return {
Joker = AutoFile
}
