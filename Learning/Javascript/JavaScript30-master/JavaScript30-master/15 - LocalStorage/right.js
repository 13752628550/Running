const addItems = document.querySelector('.add-items');
const itemsList = document.querySelector('.plates');
const items = JSON.parse(localStorage.getItem('items')) || [];
console.log(items);
function addItem(e){
    e.preventDefault();
    const text = (this.querySelector('[name=item]')).value;
    console.log(text);
    const item = {
        text,
        dong:false
    }
    items.push(item);
    console.log(items);
    localStorage.setItem('items',JSON.stringify(items));
    populateList(items,itemsList);
    this.reset();
}
function populateList(plates=[],platesList){
    platesList.innerHTML = plates.map((plate,i)=>{
        return `
            <li>
                <input type="checkbox" data-index=${i} id="item${i}" ${plate.done ? 'checked':''}>
                <label for = "item${i}">${plate.text}</label>
            </li>
        `;
    }).join('');
}
function toggleDone(e){
    if(!e.target.matches('input')) return;
    const el = e.target;
    const index = el.dataset.index;
    items[index].done = !items[index].done;
    localStorage.setItem('items',JSON.stringify(items));
    populateList(items,itemsList);
};


















































addItems.addEventListener('submit',addItem);
itemsList.addEventListener('click',toggleDone);
populateList(items,itemsList);