import * as repository from '../repository/member.js';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

/** 
 * 로그인
 */
export const getLogin = async (req, res, next) => {
    const { id, pwd } = req.body;
    const pwdHash = await repository.getPassword(id);
    if (!pwdHash) {
        res.json({ "isLogin": false })
    } else {
        const isLogin = await bcrypt.compare(pwd, pwdHash.pwd);
        let token = '';

        if (isLogin) {
            //로그인 인증 - jwttoken
            token = await jwt.sign({ id }, 'secret', { expiresIn: '7d' });
        } else {
            res.json({ "isLogin": false })
        }
        res.json({ isLogin, token, "role": pwdHash.role });
    }
}

/** 
 *  회원가입
 */
export const getSignup = async (req, res, next) => {
    const { id, pwd, name, phone, emailDomain, emailName } = req.body;
    const pwdHash = await bcrypt.hash(pwd, 10);
    const email = emailName.concat('@', emailDomain);
    const member = { ...req.body, "pwdHash": pwdHash, "email": email };

    const result = await repository.getSignup(member);
    res.json({ "isSignup": result });
}

/** 
 * 아이디 중복 체크
 */
export const getIdCheck = async (req, res, next) => {
    const { id } = req.body;
    const isIdCheck = await repository.getIdCheck(id);
    res.json(isIdCheck);
}