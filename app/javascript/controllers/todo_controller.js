import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox", "task"];

  connect() {
    this.boundCheckboxChange = this.handleCheckboxChange.bind(this);

    this.checkboxTargets.forEach((checkbox) => {
      checkbox.addEventListener("change", this.boundCheckboxChange);
    });

    // Apply the visibility state when the page loads
    window.addEventListener("load", () => {
      this.applyVisibilityState();
    });
  }

  disconnect() {
    if (this.boundCheckboxChange) {
      this.checkboxTargets.forEach((checkbox) => {
        checkbox.removeEventListener("change", this.boundCheckboxChange);
      });
    }
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
  complete(event) {
    const checkbox = event.currentTarget;
    const taskId = checkbox.dataset.taskId;

    this.handleCheckboxChange(event);
    this.sendCompleteRequest(taskId)
      .then(() => {
        window.location.href = "/completed_tasks";
      })
      .catch((error) => {
        console.error("Error completing task:", error);
      });
  }

  sendCompleteRequest(taskId) {
    return fetch(`/todo_list_tasks/${taskId}/complete_task`, {
      method: "POST",
      headers: {
        "X-CSRF-Token": this.csrfToken,
      },
    });
  }

  get csrfToken() {
    const tokenElement = document.querySelector('meta[name="csrf-token"]');
    return tokenElement ? tokenElement.getAttribute("content") : "";
  }
}
