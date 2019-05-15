
<html>
    <head>
            <script
            src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
            crossorigin="anonymous"></script>
            <link rel="stylesheet" type="text/css" href="stylesheet/widescreen/newPost.css">
            <script language="javascript" src="javascript/newPostStyle.js"></script>
            <title>

        </title>
    </head>
    <body>
        <div class="main-container">
            <div class="modal">
                <div class="modal-header">

                </div>
                <div id="modal-body">
                    <div id="input-box">
                    <label id="title" >Title</label>
                <input type="text" id="title-content">
                <div id="error-title-message"class="error"></div>
                </div>
                <div id="select-box">
                <select id="category-list" >
                    <option value="0">Select Category</option>
                </select>
                <div id="#error-tag-list-message" class="error"></div>
                </div>
                <div id="post-content-box">
                    <textarea  id="post-content" rows="30"cols="70"></textarea>
                   <div id="error-post-content-message" class="error">
                       </div>

                   </div>
                <div class="modal-footer">
                    <button id="post-it">Post</button>
                    <button id="save-for-later"> Save Draft</button>
                </div>


            </div>
        </div>
        </div>
    </body>

</html>