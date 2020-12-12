window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener('input', function(){
    const inputValue = priceInput.value;
    const addtaxprice = document.getElementById("add-tax-price");
    addtaxprice.innerHTML = `${ Math.floor(inputValue * 0.1)}`;
    const profitValue = document.getElementById("profit");
    profitValue.innerHTML = `${ Math.floor(inputValue - addtaxprice.innerHTML)}`;
  })
})