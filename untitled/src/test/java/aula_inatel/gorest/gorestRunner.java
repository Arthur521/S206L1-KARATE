package aula_inatel.gorest;

import com.intuit.karate.junit5.Karate;

class gorestRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("gorest").relativeTo(getClass());
    }

}
