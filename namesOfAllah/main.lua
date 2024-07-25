require "import"
import "cjson"
import "android.widget.*"
import "android.view.*"
import "android.app.*"
dir=package.searchpath("main",package.path):match("(.*)main.lua")
name="names of allah"
layout={
    LinearLayout;
    {
        ListView;
        id="names";
    };
}
dlg=activity
dlg.setTitle(name)
dlg.setContentView(loadlayout(layout))
adapter = ArrayAdapter(dlg, android.R.layout.simple_list_item_1)
file=io.open(dir .. "data/namesOfAllah.json","r")
data={names={}}
if file then
    data=cjson.decode(file:read("*all"))
    file:close()
end 

for _,allahName in ipairs(data.names) do
    adapter.add(allahName.name .. " : " .. allahName.meaning)
end
names.setAdapter(adapter)