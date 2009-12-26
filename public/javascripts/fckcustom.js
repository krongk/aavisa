// CHANGE FOR APPS HOSTED IN SUBDIRECTORY
FCKRelativePath = '';

// DON'T CHANGE THESE
FCKConfig.LinkBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Connector='+FCKRelativePath+'/fckeditor/command';
FCKConfig.ImageBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Image&Connector='+FCKRelativePath+'/fckeditor/command';
FCKConfig.FlashBrowserURL = FCKConfig.BasePath + 'filemanager/browser/default/browser.html?Type=Flash&Connector='+FCKRelativePath+'/fckeditor/command';

FCKConfig.LinkUploadURL = FCKRelativePath+'/fckeditor/upload';
FCKConfig.ImageUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Image';
FCKConfig.FlashUploadURL = FCKRelativePath+'/fckeditor/upload?Type=Flash';
FCKConfig.SpellerPagesServerScript = FCKRelativePath+'/fckeditor/check_spelling';
FCKConfig.AllowQueryStringDebug = false;
FCKConfig.SpellChecker = 'SpellerPages';

// ONLY CHANGE BELOW HERE
FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/silver/';

FCKConfig.ToolbarSets["Simple"] = [ 
['Cut','Copy','Paste','PasteWord'], 
['Undo','Redo','-','Find','Replace','-','SelectAll'], 
['Bold','Italic','Underline','StrikeThrough'], 
['OrderedList','UnorderedList','-','Outdent','Indent'], 
['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'], 
['Link','Unlink'], 
'/', 
['Source','-','-','Templates'],
['Image','Table','Rule','Smiley'], 
['FontName','FontSize'], 
['TextColor','BGColor'],
] ;

FCKConfig.ToolbarSets["Base"] = [ 
['FontName','FontSize','TextColor','BGColor',
'Bold','Italic','Underline','StrikeThrough',  
'JustifyLeft','JustifyCenter','JustifyRight','JustifyFull', 
'Link','Unlink','Table']
] ;

FCKConfig.ToolbarSets["None"] = [ 
[]
] ;