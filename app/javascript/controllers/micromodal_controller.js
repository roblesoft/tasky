import { Controller } from "stimulus"
import MicroModal from 'micromodal';

export default class extends Controller {
  connect() {
  }

  show() {
    MicroModal.show(this.data.get('id'))
  }
}
