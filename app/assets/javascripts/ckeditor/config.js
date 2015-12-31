CKEDITOR.editorConfig = function (config) {
    //config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
    //config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";
    //config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";
    //config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
    //config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
    //config.filebrowserImageUploadUrl = "/ckeditor/pictures";
    //config.filebrowserUploadUrl = "/ckeditor/attachment_files";

    config.toolbar = [
        //{ name: 'insert',  items: ["Image"] },
        { name: 'basicstyles',  items: ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"] },
        { name: 'links',  items: ["Link",  "Unlink"] },
        { name: 'paragraph',  items: ["NumberedList",  "BulletedList",  "Outdent", "Indent", "Blockquote"] }
        //{ name: 'styles', items: [ 'Font', 'FontSize' ] },
        //{ name: 'font', items: [ 'Font', 'FontSize' ] },
        //{ name: 'colors', items: [ 'TextColor','BGColor' ] },
    ];
    //config.toolbar = "simple";


};