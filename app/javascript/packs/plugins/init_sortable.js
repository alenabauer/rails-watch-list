import Sortable from 'sortablejs';



const initSortable = () => {
  document.addEventListener('turbolinks:load', () => {
    const list = document.querySelector('#results');
    Sortable.create(list, {
      ghostClass: "ghost",
      animation: 200
    });
  })
};

export { initSortable };
