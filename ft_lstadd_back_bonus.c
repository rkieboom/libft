/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_lstadd_back.c                                   :+:    :+:            */
/*                                                     +:+                    */
/*   By: rkieboom <rkieboom@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/11/13 15:50:50 by rkieboom       #+#    #+#                */
/*   Updated: 2019/11/15 17:21:44 by rkieboom      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstadd_back(t_list **alst, t_list *new)
{
	t_list *nlist;

	if (!alst)
		return ;
	else if (*alst)
	{
		nlist = *alst;
		nlist = ft_lstlast(*alst);
		nlist->next = new;
		new = nlist->next;
	}
	else
		ft_lstadd_front(alst, new);
}