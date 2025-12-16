import { Controller } from "@hotwired/stimulus";

// Handles expanding/collapsing the left navbar and keeping active states in sync
export default class extends Controller {
  static targets = ["navbar", "toggle", "link"];

  connect() {
    this.handleToggle = this.handleToggle.bind(this);
    this.handleLinkClick = this.handleLinkClick.bind(this);

    if (this.hasToggleTarget) {
      this.toggleTarget.addEventListener("click", this.handleToggle);
    }

    this.linkTargets.forEach((link) =>
      link.addEventListener("click", this.handleLinkClick)
    );

    this.markActiveLink();
  }

  disconnect() {
    if (this.hasToggleTarget) {
      this.toggleTarget.removeEventListener("click", this.handleToggle);
    }

    this.linkTargets.forEach((link) =>
      link.removeEventListener("click", this.handleLinkClick)
    );
  }

  handleToggle() {
    this.navbarTarget.classList.toggle("show-menu");
    this.toggleTarget.classList.toggle("rotate-icon");
  }

  handleLinkClick(event) {
    this.setActiveLink(event.currentTarget);
  }

  markActiveLink() {
    const active = this.linkTargets.find(
      (link) => link.getAttribute("href") === window.location.pathname
    );

    if (active) {
      this.setActiveLink(active);
    }
  }

  setActiveLink(link) {
    this.linkTargets.forEach((item) => item.classList.remove("active-link"));
    link.classList.add("active-link");
  }
}
