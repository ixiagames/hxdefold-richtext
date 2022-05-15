package richtext;

import richtext.RichText.Settings;

@:luaRequire("richtext.tags")
extern class Tags {

    public static function register(tag:String, handler:(params:String, settings:Settings)->Void):Void;
    public static function apply(tag:String, params:String, settings:Settings):Void;
    
}