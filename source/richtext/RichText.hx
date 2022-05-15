package richtext;

import defold.Gui.GuiNode;
import defold.support.ScriptOnInputAction;
import defold.types.Hash;
import defold.types.Vector3;
import defold.types.Vector4;
import lua.Table;

@:luaRequire("richtext.richtext")
extern class RichText {

    public static function create(text:String, font:String, ?settings:Settings):CreateResult;
    public static function remove(words:Table<String, Word>):Void;
    public static function tagged(words:Table<String, Word>, tag:String):Table<String, Word>;
    public static function on_click(words:Table<String, Word>, action:ScriptOnInputAction):Bool;
    
}

typedef Settings = {

    ?width:Float,
    ?position:Vector3,
    ?size:Float,
    ?parent:GuiNode,
    ?fonts:Dynamic,
    ?layers:Dynamic,
    ?color:Vector4,
    ?shadow:Vector4,
    ?outline:Vector4,
    ?align:Align,
    ?valign:Hash,
    ?line_spacing:Float,
    ?paragraph_spacing:Float,
    ?image_pixel_grid_snap:Bool,
    ?combine_words:Bool

}

typedef Font = {

    ?regular:Hash,
    ?italic:Hash,
    ?bold:Hash,
    ?bold_italic:Hash

}

@:multiReturn extern class CreateResult {

    public var words:Table<String, Word>;
    public var metrics:TextMetrics;

}

typedef TextMetrics = {

    width:Float,
    height:Float,
    char_count:Int,
    img_count:Int,
    spine_count:Int

}

typedef Word = {

    size:Float,
    color:Vector4,
    shadow:Vector4,
    outline:Vector4,
    node:GuiNode,
    metrics:WordMetrics,
    font:String,
    text:String

}

typedef WordMetrics = {

    width:Float,
    height:Float,
    total_width:Float,
    max_descent:Float,
    max_ascent:Float

}

@:native("__richtext_RichText")
@:enum extern abstract Align(Hash) to Hash {
    
    @:native("ALIGN_LEFT")      var LEFT;
    @:native("ALIGN_CENTER")    var CENTER;
    @:native("ALIGN_RIGHT")     var RIGHT;
    @:native("ALIGN_JUSTIFY")   var JUSTIFY;

}

@:native("__richtext_RichText")
@:enum extern abstract VAlign(Hash) to Hash {
    
    @:native("VALIGN_TOP")      var TOP;
    @:native("VALIGN_MIDDLE")   var MIDDLE;
    @:native("VALIGN_BOTTOM")   var BOTTOM;

}