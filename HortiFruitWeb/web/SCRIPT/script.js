function teste(){
    alert("Atestado.");
}

 async function enviarProduto(){
    const form = document.getElementById("form-cadastra-produto");
    if (form.checkValidity()){
        const result = new FormData(form);
        let data = new URLSearchParams(result).toString();
        let resposta =  fetch("produtoCadastro",
        {
            method: "POST",
            headers: { 'Content-Type':'application/x-www-form-urlencoded' },
            body: data
        })
        .then(res => {
            if(res.ok){
                return true;
            } else {
                return false;
            }
        });
        
        if (resposta){
            showPopupOk();
        } else {
            showPopupError();
        }
        
    } else {
        showPopupError();
    }
}


function gerarPedido(){
    fetch("pedido")
    .then(res => { 
        if(res.ok){
            window.location.href = "home";
            return console.log("Sucesso. " + res); 
        }
    })
    .catch(res =>{ return console.error("Erro em criar pedido. " + res);});
}

function gerarProdutos(){
    fetch("produtoLista")
    .then(res => { 
        window.location.href = "produtos";
        return console.log("Sucesso. " + res); })
    .catch( res => {return console.error("Erro em criar pedido. " + res);});
}


function gerarCarrinho(idCarrinho){
    const requisicao = `carrinhoLoad?carrinho_id=${idCarrinho}`;
    try{
        fetch(requisicao)
        .then(res => { 
            return console.log("Sucesso. " + res); })
        .catch( res => {return console.error("Erro em criar pedido. " + res);});
    } catch(ex) {
        alert(ex);
    }

}

function gerarProdutosPrimeiro(){
    if(!sessionStorage.getItem('recarregarPagina')){
        gerarProdutos();
        sessionStorage.setItem('recarregarPagina', 'true');
    }
}

function mostrarModalInsert(){
    const modal = document.getElementById("idInsert");
    modal.classList.toggle("visibility");
}

function adicionarAoCarrinho(idCarrinho, idProduto, idNmProduto, idEstoque, idValor){
    mostrarModalInsert();
    const idCarrinhoInput = document.getElementById("idCarrinho");
    const idProdutoInput = document.getElementById("idProduto");
    const idNmProdutoInput = document.getElementById("idNmProduto");
    const idEstoqueInput = document.getElementById("idEstoque");
    const idValorInput = document.getElementById("idValor");
    idCarrinhoInput.value = idCarrinho;
    idProdutoInput.value = idProduto;
    idNmProdutoInput.value = idNmProduto;
    idEstoqueInput.value = idEstoque;
    idValorInput.value = idValor;
}

function adicionarProdutoCarrinho(){
    try{
        
        const idCarrinho = document.getElementById("idCarrinho").value;
        const idProduto = document.getElementById("idProduto").value;
        const idNmProduto = document.getElementById("idNmProduto").value;
        const idValor = document.getElementById("idValor").value;
        const idEstoque = document.getElementById("idEstoque").value;
        const quantidade = document.getElementById("idQuantidade").value;
        
        const data = {
            idCarrinho: idCarrinho,
            idProduto: idProduto,
            idNmProduto: idNmProduto,
            idValor: idValor,
            idEstoque: idEstoque,
            quantidade: quantidade
        };      
        const params = new URLSearchParams(data);

       fetch("carrinhoInsert",
       {
           method: "POST",
           headers: { 'Content-Type':'application/x-www-form-urlencoded'},
           body: params,
       })
       .then(res => {
           if(res.ok){
               mostrarModalInsert();
               return true;
           } else {
               alert("Erro ao cadastrar produto.");
               return false;
           }
       });     
     } catch(ex){
         alert(ex);
     }
}

function mostrarModalEdit(){
    const modal = document.getElementById("idEdit");
    modal.classList.toggle("visibility");
}

function editarProduto(idProduto, nmProduto, categoriaProduto, estoque, valor){
    mostrarModalEdit();
    document.getElementById("idProdutoEdit").value = idProduto;
    document.getElementById("nmProdutoEdit").value = nmProduto;
    document.getElementById("categoriaEdit").value = categoriaProduto;
    document.getElementById("estoqueEdit").value = estoque;
    document.getElementById("valorEdit").value = valor;
}

async function enviarEditar(){
     try{    
        const data = {
            idProdutoEdit: document.getElementById("idProdutoEdit").value,
            nmProdutoEdit: document.getElementById("nmProdutoEdit").value,
            categoriaEdit: document.getElementById("categoriaEdit").value,
            estoqueEdit: document.getElementById("estoqueEdit").value,
            valorEdit:  document.getElementById("valorEdit").value
        };      
        const params = new URLSearchParams(data);

       await fetch("editarProduto",
       {
           method: "POST",
           headers: { 'Content-Type':'application/x-www-form-urlencoded'},
           body: params
       })
       .then(res => {
           if(res.ok){
               mostrarModalEdit();
               return true;
           } else {
               alert("Erro ao cadastrar produto.");
               return false;
           }
       });   
       gerarProdutos();
     } catch(ex){
         alert(ex);
     }
}

async function excluirProduto(idProduto){
    const parametro = new URLSearchParams();
    parametro.append("idProduto", idProduto);
    const resultado = await fetch("excluirProduto",{
        method:"POST",
        headers:{'Content-Type':'application/x-www-form-urlencoded'},
        body:parametro,
    })
    .then(res=>{
        if(res.ok){
            return true;
        } else {
            return false;
        }
    })
    .catch(err => {
        console.error(err);
        return false;
    });
    
    if(resultado){
        gerarProdutos();
    } else {
        showPopupError();
    }
}


function excluirItem(idCarrinho){
    try{
        const url = `deleteProduto?idCarrinho=${idCarrinho}`;
        fetch(url)
        .then(res => {
           if(res.ok){
               window.location.href = "carrinho";
               return true;
           } else {
               alert("Erro ao excluir produto.");
               return false;
           }
       });  
    } catch (ex) {
        alert(ex);
    }
}

async function finalizarCompra(idCarrinho){
    try{
        const url = `finalizarCompra?idPedido=${idCarrinho}`;
        const result = await fetch(url)
        .then(res => {
           if(res.ok){
               return true;
           } else {
               alert("Erro ao excluir produto.");
               return false;
           }
       });  
       
       if(result){
            downloadPDF();
            showPopupOk();
       } else {
           alert("Ocorreu um erro em finalizar sua compra.");
       }
       
    } catch (ex) {
        alert(ex);
    }
}



function showPopupOk(){
    const popup = document.getElementById("popupOk");
    popup.classList.toggle("displayView");
}

function showPopupError(){
    const popup = document.getElementById("popupError");
    popup.classList.toggle("displayView");
}

function sair(){
    fetch("finalizarSessao")
    .then(()=>{ 
        window.location.href = "login";
        return true;})
    .catch( ex=>{ 
        alert("Erro em: " + ex);
    });
}



async function downloadPDF(){
    const item = document.querySelector(".card-body");
    
    var opt = {
      margin:1,
      filename:"Notinha.pdf",
      html2canvas: {scale: 2},
      jsPDF: { unit: "in", format: "letter", orientation:"portrait"},
    };
    
    html2pdf().set(opt).from(item).save();
}