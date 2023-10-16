import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox", "task"];

  connect() {
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.addEventListener("change", this.handleCheckboxChange.bind(this));
    });

    // Apply the visibility state when the page loads
    window.addEventListener("load", () => {
      this.applyVisibilityState();
    });
  }

  disconnect() {
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.removeEventListener("change", this.handleCheckboxChange);
    });
  }

  handleCheckboxChange(event) {
    const checkbox = event.currentTarget;
    const taskId = checkbox.getAttribute("data-task-id");
    if (checkbox.checked) {
      console.log(`Checkbox is checked for task ${taskId}`);
      // Add your logic for handling checked checkboxes here
      this.taskTarget.classList.add("fade-out");
      setTimeout(() => {
        this.taskTarget.classList.add("d-none");
      }, 2000);

      // Store the visibility state in localStorage
      localStorage.setItem(`taskVisibility_${taskId}`, "hidden");
    } else {
      console.log(`Checkbox is not checked for task ${taskId}`);
      // Add your logic for handling unchecked checkboxes here

      // Store the visibility state in localStorage
      localStorage.setItem(`taskVisibility_${taskId}`, "visible");
    }
  }

  applyVisibilityState() {
    this.taskTargets.forEach((task) => {
      const taskId = task.getAttribute("data-task-id");
      const isHidden = localStorage.getItem(`taskVisibility_${taskId}`);

      if (isHidden === "hidden") {
        task.classList.add("d-none");
      }
    });
  }
}
