package aula_inatel.sw;

import com.intuit.karate.junit5.Karate;

class swRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("sw").relativeTo(getClass());
    }

}
