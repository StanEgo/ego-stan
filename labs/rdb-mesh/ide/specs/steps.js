"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const cucumber_1 = require("cucumber");
class FakeQueryService {
    execute(query) {
        throw new Error(`Method not implemented: ${query}`);
    }
}
class SpecEnvironment {
    constructor(query) {
        this.query = query;
    }
    get focus() {
        if (!this._focus) {
            throw Error("Focus is not set");
        }
        return this._focus;
    }
    set focus(value) {
        this._focus = value;
        this.log(`Set focus #${value}`);
    }
    log(message) {
        console.log(`SPEC: ${message}`);
    }
}
const query = new FakeQueryService();
const environment = new SpecEnvironment(query);
cucumber_1.Given("Focus is #{word}", (id) => {
    environment.focus = id;
});
