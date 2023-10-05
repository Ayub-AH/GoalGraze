import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="todo"
export default class extends Controller {
  static targets = ["checkbox"];

  connect() {
    // Add an event listener to the checkbox elements
    console.log("stimulus loaded")
    console.log("CSRF Token:", document.querySelector('meta[name="csrf-token"]').getAttribute("content"));

    this.checkboxTargets.forEach((checkbox) => {
      checkbox.addEventListener("change", () => {
        this.updateTaskStatus(checkbox);
      });
    });
  }

  updateTaskStatus(checkbox) {
    const taskId = checkbox.dataset.taskId;
    const completed = checkbox.checked;

    // Make an AJAX request to update the task status
    fetch(`/todo_list_tasks/${taskId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content"),
      },
      body: JSON.stringify({ todo_list_task: { completed } }),
    })
      .then((response) => {
        if (response.ok) {
          console.log("Task completion status updated.");
          if (completed) {
            // Schedule a timer to move the task to completed items
            setTimeout(() => {
              this.moveToCompletedItems(taskId);
            }, 5000);
          }
        } else {
          console.error("Failed to update task completion status.");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }

  moveToCompletedItems(taskId) {
    // Make an AJAX request to move the completed task to completed items
    fetch(`/todo_list_tasks/${taskId}/move_to_completed`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content"),
      },
    })
      .then((response) => {
        if (response.ok) {
          console.log("Task moved to completed items.");
        } else {
          console.error("Failed to move task to completed items.");
        }
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
}
