
import { Controller } from "stimulus"
import { Sortable } from '@shopify/draggable';

export default class extends Controller {
  static targets = ['container', 'column']


  connect() {
    const containers = document.querySelectorAll('.draggable-container');

    const sortable = new Sortable(containers, {
      draggable: '.StackedListItem--isDraggable',
      mirror: {
        appendTo: '.draggable-container',
        constrainDimensions: true,
      },
    });

    sortable.on('drag:stop', evt => {
      console.log(evt.data.source.dataset.id)
      console.log(evt.data.source.parentElement.dataset.list)
    })
  }
}