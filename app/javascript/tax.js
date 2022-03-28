window.addEventListener('load', () =>{
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
    priceInput.addEventListener("input", () => {
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = Math.round(priceInput.value * 0.1);
      const profit = document.getElementById("profit");
      profit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1))
    })
});