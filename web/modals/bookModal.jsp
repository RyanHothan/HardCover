<div id="basic-modal-content">
    <h3 id="modalTitle"></h3>
    <div class="col-md-4">
        <img id = "modalImage" src="" class="img-responsive" style="max-height: 200px; test-align:left">
    </div>
    <div class="col-md-7">
        <div id = "modalDescription" style="text-align:center; font-size:12px"></div>
    </div>
    <div class="col-md-10"></div>
    <div class ="col-md-10">
        <p id = "modalGenres" style="line-height:80%"></p>
        <p id = "modalLanguage" style="line-height:40%"></p>
        <p id = "modalCopies" style="line-height:40%"></p>
        <p id = "modalPublisher" style="line-height:40%"></p>
        <div class = "col-md-6"> <button class ="btn btn-default" type="button">Return Book</button> </div>
        <button class ="btn btn-default" type="button" onclick="borrowBook(document.location.hash)">Borrow Book</button>
    </div>
</div>	