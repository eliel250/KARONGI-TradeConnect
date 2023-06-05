
package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author w
 */
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class UserDetails {
      private int id;
    private String username;
    private String password;
    private String email;
    private  String role="admin";
    private String createdAt;
}
