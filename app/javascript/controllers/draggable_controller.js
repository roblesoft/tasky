
import { Controller } from "stimulus"
import { Sortable } from '@shopify/draggable';
import Rails from '@rails/ujs';

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
      let id = evt.data.source.dataset.id
      let listId = evt.data.source.parentElement.dataset.list
      Rails.ajax({
        type: "POST", 
        url: `/tasks/${id}/change_task_list`,
        data: new URLSearchParams({ list_column_id: listId }).toString(),
        success: function(response){
          console.log(true)
        },
        error: function(response){
          console.error(false)
        }
      })
    })
  }
}