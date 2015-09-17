
require("config")
require("cocos.init")
require("framework.init")
require("app.Data")
require("app.class.ModifyData")
require("app.class.PublicData")
local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end
          
function MyApp:run()
    cc.FileUtils:getInstance():addSearchPath("res/")
    cc.FileUtils:getInstance():addSearchPath("res/ui/")
    self:enterScene("ResourceLoadScene")

end
return MyApp