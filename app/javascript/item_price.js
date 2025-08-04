const price = () => {
  const priceInput = document.getElementById("item-price");
  const taxDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  if (!priceInput || !taxDisplay || !profitDisplay) return;

  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value);

    if (isNaN(inputValue)) {
      taxDisplay.textContent = "";
      profitDisplay.textContent = "";
      return;
    }

    if (inputValue >= 300 && inputValue <= 9999999) {
      const tax = Math.floor(inputValue * 0.1);
      const profit = inputValue - tax;

      taxDisplay.textContent = tax.toLocaleString();
      profitDisplay.textContent = profit.toLocaleString();
    } else {
      taxDisplay.textContent = "";
      profitDisplay.textContent = "";
    }
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);