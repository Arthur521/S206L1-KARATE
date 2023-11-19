package aula_inatel.poke;

import com.intuit.karate.junit5.Karate;

class pokeRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("poke").relativeTo(getClass());
    }

}
