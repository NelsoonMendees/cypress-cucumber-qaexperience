import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

Given("que acesso a pagina de login", function () {
  cy.visit("https://loginxp.vercel.app");
});

When("submeto minhas credenciais:", function (dataTable) {
  const user = dataTable.rowsHash();

  user.userName
    ? cy.get("input[name=user]").type(user.userName)
    : cy.log("User em branco");

  user.password
    ? cy.get("input[name=pass]").type(user.password)
    : cy.log("Pass em branco");

  cy.contains("button", "Entrar").click();
});

Then("sou autenticado no sistema", function () {
  cy.get(".swal2-html-container")
    .should("be.visible")
    .should("have.text", "Suas credenciais são válidas :)");
});

Then("devo ver a notificação {string}", function (notice) {
  cy.get(".toast-message").should("be.visible").should("have.text", notice);
});
