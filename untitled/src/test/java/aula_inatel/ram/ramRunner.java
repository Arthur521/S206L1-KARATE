package aula_inatel.ram;

import com.intuit.karate.junit5.Karate;

class ramRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("ram").relativeTo(getClass());
    }

}
