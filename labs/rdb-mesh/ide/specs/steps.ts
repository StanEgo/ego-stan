import { ID } from "@ide/mesh";
import { IQuery, IQueryResult, IQueryService } from "@ide/api";
import { Before, BeforeAll, Given } from "cucumber";

class FakeQueryService implements IQueryService {
    execute(query: IQuery): IQueryResult {
        throw new Error(`Method not implemented: ${query}`);
    }
}

class SpecEnvironment {
    constructor(private query: IQueryService) {

    }

    private _focus: ID | undefined;
    get focus(): ID {
        if (!this._focus) {
            throw Error("Focus is not set");
        }

        return this._focus;
    }
    set focus(value: ID) {
        this._focus = value;

        this.log(`Set focus #${value}`);
    }

    log(message: string): void {
        console.log(`SPEC: ${message}`);
    }
}

const query: IQueryService = new FakeQueryService();
const environment: SpecEnvironment = new SpecEnvironment(query);

Given("Focus is #{word}", (id: ID) => {
    environment.focus = id;
});
