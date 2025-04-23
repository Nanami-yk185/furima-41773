window.addEventListener('turbo:load', () => {

  const priceInput = document.getElementById("item-price");
  console.log("priceInput",priceInput);
  
  if (priceInput) {
  priceInput.addEventListener("input", () => {
  console.log("イベント発火");
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  const tax = Math.floor(inputValue * 0.1);
  const profit = Math.floor(inputValue - tax);
  addTaxDom.innerHTML = `${tax}円`;
  profitDom.innerHTML = `${profit}円`;
    });
  }
});

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
