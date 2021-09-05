local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Abd(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevAbd:del(SHBAH.."Abd:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Abd(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevAbd:set(SHBAH.."Abd:Lock:AutoFile",true) 
end 
end

if (text and not DevAbd:get(SHBAH.."Abd:Lock:AutoFile")) then
Time = DevAbd:get(SHBAH.."Abd:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevAbd:smembers(SHBAH..'Abd:Groups') 
local BotName = (DevAbd:get(SHBAH.."Abd:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..SHBAH..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevAbd:get(SHBAH.."Abd:Groups:Links"..v)
Welcomes = DevAbd:get(SHBAH..'Abd:Groups:Welcomes'..v) or ''
AbdConstructors = DevAbd:smembers(SHBAH..'Abd:AbdConstructor:'..v)
BasicConstructors = DevAbd:smembers(SHBAH..'Abd:BasicConstructor:'..v)
Constructors = DevAbd:smembers(SHBAH..'Abd:Constructor:'..v)
Managers = DevAbd:smembers(SHBAH..'Abd:Managers:'..v)
Admis = DevAbd:smembers(SHBAH..'Abd:Admins:'..v)
Vips = DevAbd:smembers(SHBAH..'Abd:VipMem:'..v)
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
if #AbdConstructors ~= 0 then
GetJson = GetJson..'"AbdConstructors":['
for k,v in pairs(AbdConstructors) do
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
local File = io.open('./'..SHBAH..'.json', "w")
File:write(GetJson)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id='..DevId..'" -F "document=@'..SHBAH..'.json' .. '" -F "caption=⌁︙يحتوي الملف على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..SHBAH..'.json')
DevAbd:set(SHBAH.."Abd:AutoFile:Time",os.date("%x"))
end
else 
DevAbd:set(SHBAH.."Abd:AutoFile:Time",os.date("%x"))
end
end

end
return {
SHBAH = AutoFile
}